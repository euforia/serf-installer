==============
Serf Installer
==============
A serf installer that also sets up the handler directory structure and with sample echo handler scripts.

It sets the **-event-handler flag to **/etc/serf/handlers/router.sh**.  This catch-all event handler appropriately calls all the scripts under the particular event.

For example::

	Upon receiving a **member-join** event, all the scripts under **/etc/serf/handlers/member-join** matching the regex **`_handler\.[a-z]{2}$`** for their name will be sequentially executed.

Custom Events
-------------
A sample custom event has also been included called **test.handler**.  With the corresponding handler directory **/etc/serf/handlers/user-test.handler**