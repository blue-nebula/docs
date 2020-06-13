Blue Nebula Documentation
=========================

This repository is the home of most of the documentation available for Blue Nebula.
It is the central source of information for users of the Blue Nebula project (players, mappers, developers, basically everyone.).

You can view it deployed on https://docs.blue-nebula.org/.


Build
-----

This is a `Sphinx <https://sphinx-doc.org>`_ project, and can be built like
any other Sphinx project (e.g., using :code:`make html`)

For less experienced users of Sphinx/Python/virtualenv etc., a convenience script that sets up a local isolated Sphinx environment is included. It's a transparent wrapper for the :code:`Makefile`, and can be used as a drop-in replacement :code:`./make.sh html`.

For development (i.e., writing documentation), `sphinx-autobuild <https://github.com/GaretJax/sphinx-autobuild>`_ has been integrated into the build system, which sets up a live-reloading webserver that rebuilds the site on changes and reloads the page in the browser automatically. You can use it by running :code:`./make.sh watch`.
