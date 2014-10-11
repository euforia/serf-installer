==============
Serf Installer
==============
A serf installer that also sets up the handler directory structure and with sample echo handler scripts.

It sets the **-event-handler** flag to **/etc/serf/handlers/router.sh**.  This catch-all event handler appropriately calls all the scripts under the particular event matching the regex **`_handler\.[a-z]{2}$`** for their name.

For example::

	**member-join**

	All the scripts under **/etc/serf/handlers/member-join**  will sequentially be executed.

Custom Events
-------------
A sample custom event has also been included called **test.handler**, with the corresponding handler directory **/etc/serf/handlers/user-test.handler**