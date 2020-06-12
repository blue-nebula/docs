Legacy auth protocol
====================

Blue Nebula supports, as of yet, the good ol' Red Eclipse auth protocol. We call it the *legacy protocol*.

This page contains a high-level as well as a low-level description of the protocol. These information were reverse-engineered from the source code of Blue Nebula, and implemented in the `Python masterserver <https://github.com/TheAssassin/python-masterserver>`_ and `bluenebula-auth <https://github.com/TheAssassin/bluenebula-auth/>`_ open-source projects. The latter is a full standalone implementation, and can be used for evaluation purposes.

.. note::

   This protocol has several design flaws, so it will eventually be replaced by a robust alternative.


.. contents:: Contents
   :local:
   :depth: 1


Introduction
------------

The auth protocol is used for two purposes. Its original use case was to allow users to authenticate on servers using a centralized authentication server, the *master server*. This concept has originated in *Cube 2: Sauerbraten*, where global admins could use it to authenticate on all servers that were hosted on the official server list, and perform some moderation.

In *Red Eclipse*, the concept was extended with a basic roles concept. This way, permissions, especially the global ones, could be granted to players more fine-grainedly.

In a later *Red Eclipse* 1.x release, they also added support for authenticating servers using a protocol very similar to the client authentication workflow.

For *Blue Nebula*, it is planned to support only user authentication with the old protocol. If needed, we might consider implementing some server authentication again.


Client authentication
---------------------

As mentioned before, the original and most well-known use case of this protocol is user authentication. *Red Eclipse* introduced  multiple roles to grant users permissions with. Some of them can be assigned locally on servers, some of them only in the global scope.

- *founder* (also known as *creator*, code :code:`c`) -- administrative, this role is only available in the global scope
- *developer* (code :code:`d`) -- administrative, developers of the game, global scope role, same permissions as *admin*
- *admin* (code :code:`a`) -- administrative, local and global role, no account required for local (using :code:`sv_adminpass` server variable)
- *operator* (code :code:`o`) -- administrative, local and global role [1]_
- *moderator* (code :code:`m`) -- administrative, local and global role [1]_
- *supporter* (code :code:`m`) -- non-administrative, local and global role [1]_
- *player* (also known as *user*, code :code:`u`) -- non-administrative, global-only role, basic role if user authenticated with an account
- *none* -- not a real role, assigned to every user who has not authenticated

.. [1] can be assigned server-locally by admins to owners of an account or by an active admin using the :code:`addpriv` command, both in-game and in the server configuration

The general workflow is described in the sequence diagram below.

.. uml:: auth-workflow-client.puml


