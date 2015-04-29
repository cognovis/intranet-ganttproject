-- upgrade-4.1.0.1.0-4.1.0.1.1.sql

SELECT acs_log__debug('/packages/intranet-ganttproject/sql/postgresql/upgrade/upgrade-4.1.0.1.0-4.1.0.1.1.sql','');



update im_component_plugins
set plugin_name = 'Gantt Resources'
where plugin_name = 'Gantt Resourcs';


