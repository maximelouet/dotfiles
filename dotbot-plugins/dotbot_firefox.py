# This file is a part of dotbot-firefox <https://github.com/kurtmckee/dotbot-firefox>
# Copyright 2022-2026 Kurt McKee <contactme@kurtmckee.org>
# SPDX-License-Identifier: MIT
# Heavily modified by Saumon


from __future__ import annotations

import logging
import os
import pathlib
import sys
import typing

import dotbot.plugin
import dotbot.plugins.link

__version__ = "1.1.0-saumon"

VALID_DIRECTIVES: set[str] = {"firefox"}

log = logging.getLogger(__name__)


def _get_profile_directories() -> typing.Iterable[pathlib.Path]:
    """Yield Firefox profile directories that appear to be valid."""

    defaults: list[str] = []

    defaults.append("~/.mozilla/firefox")
    defaults.append("~/.config/mozilla/firefox")

    for default in defaults:
        path = pathlib.Path(os.path.expandvars(os.path.expanduser(default)))
        if not path.is_dir():
            continue

        for profile in path.glob("*"):
            if profile.is_dir() and (profile / "prefs.js").is_file():
                yield profile


# mypy 1.3.0 reports the following error for the Firefox class:
#
#   Class cannot subclass "Plugin" (has type "Any")  [misc]
#
# The "type: ignore[misc]" comment below suppresses this specific error.
#
class Firefox(dotbot.plugin.Plugin):  # type: ignore[misc]
    def can_handle(self, directive: str) -> bool:
        """
        Flag whether this plugin supports the given *directive*.
        """

        return directive in VALID_DIRECTIVES

    def handle(self, directive: str, data: dict[str, typing.Any]) -> bool:
        """
        Handle Firefox configuration directives.

        :raises ValueError:
            ValueError is raised if `handle()` is called with an unsupported directive.
        """

        if not self.can_handle(directive):
            message = f"The Firefox plugin does not handle the '{directive}' directive."
            raise ValueError(message)

        success: bool = True
        link_plugin = dotbot.plugins.link.Link(self._context)

        links: dict[str, typing.Any] = {}

        if "user.js" in data:
            links.update(self._get_links_user_js(data["user.js"]))

        if "userChrome.css" in data:
            links.update(self._get_links_userchrome_css(data["userChrome.css"]))

        return bool(link_plugin.handle("link", links))

    def _get_links_user_js(self, value: typing.Any) -> bool:
        """Generate links to a specified ``user.js`` in each Firefox profile directory."""

        links: dict[str, typing.Any] = {
            str(profile / "user.js"): value for profile in _get_profile_directories()
        }

        if not links:
            log.warning("No Firefox profiles found")

        return links

    def _get_links_userchrome_css(self, value: typing.Any) -> bool:
        """Generate links to a specified ``userChrome.css`` in each Firefox profile directory."""

        link_plugin = dotbot.plugins.link.Link(self._context)
        src = pathlib.Path(os.path.expandvars(os.path.expanduser(value)))

        links: dict[str, typing.Any] = {
            str(profile / "chrome" / "userChrome.css"): { "path": value, "create": True } for profile in _get_profile_directories()
        }

        if not links:
            log.warning("No Firefox profiles found")

        return links
