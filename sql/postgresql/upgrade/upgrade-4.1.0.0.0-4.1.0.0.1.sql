-- upgrade-4.1.0.0.0-4.1.0.0.1.sql

SELECT acs_log__debug('/packages/intranet-ganttproject/sql/postgresql/upgrade/upgrade-4.1.0.0.0-4.1.0.0.1.sql','');


----------------------------------------------------------------
-- 
----------------------------------------------------------------

create or replace function inline_0 ()
returns integer as $$
declare
	v_count			integer;
	i			integer;
	v_fields		varchar[];
	v_field			varchar;
	v_cmd			varchar;
begin
	v_fields := array[
'xml_active', 'xml_actualcost', 'xml_actualduration', 'xml_actualfinish',
'xml_actualovertimecost', 'xml_actualovertimework', 'xml_actualovertimeworkprotecte', 
'xml_actualsinsync', 'xml_actualstart', 'xml_actualwork', 'xml_actualworkprotected', 
'xml_acwp', 'xml_adminproject', 'xml_author', 'xml_autoaddnewresourcesandtask', 
'xml_autolink', 'xml_basecalendars', 'xml_baselineforearnedvalue', 'xml_bcwp', 
'xml_bcws', 'xml_calendaruid', 'xml_commitmenttype', 'xml_company', 
'xml_constraintdate', 'xml_constrainttype', 'xml_cost', 'xml_createdate', 
'xml_creationdate', 'xml_critical', 'xml_criticalslacklimit', 'xml_currencycode', 
'xml_currencydigits', 'xml_currencysymbol', 'xml_currencysymbolposition', 
'xml_currentdate', 'xml_cv', 'xml_dayspermonth', 'xml_defaultfinishtime', 
'xml_defaultfixedcostaccrual', 'xml_defaultovertimerate','xml_defaultstandardrate', 
'xml_defaultstarttime', 'xml_defaulttaskevmethod', 'xml_defaulttasktype',
'xml_duration', 'xml_durationformat', 'xml_earlyfinish', 'xml_earlystart',
'xml_earnedvaluemethod', 'xml_editableactualcosts', 'xml_effortdriven', 
'xml_elements', 'xml_estimated', 'xml_extendedattributes', 'xml_extendedcreationdate',
'xml_externaltask', 'xml_finish', 'xml_finishvariance', 'xml_fiscalyearstart', 
'xml_fixedcost', 'xml_fixedcostaccrual', 'xml_freeslack', 'xml_fystartdate', 
'xml_hidebar', 'xml_honorconstraints', 'xml_id', 'xml_ignoreresourcecalendar', 
'xml_insertedprojectslikesummar', 'xml_isnull', 'xml_ispublished', 'xml_issubproject',
'xml_issubprojectreadonly', 'xml_lastsaved', 'xml_latefinish', 'xml_latestart', 
'xml_levelassignments', 'xml_levelingcansplit', 'xml_levelingdelay', 
'xml_levelingdelayformat', 'xml_manual', 'xml_microsoftprojectserverurl', 
'xml_milestone', 'xml_minutesperday', 'xml_minutesperweek', 
'xml_movecompletedendsback', 'xml_movecompletedendsforward', 
'xml_moveremainingstartsback', 'xml_moveremainingstartsforward',
'xml_multiplecriticalpaths', 'xml_name', 'xml_newtaskseffortdriven', 
'xml_newtasksestimated', 'xml_newtaskstartdate', 'xml_notes', 'xml_outlinecodes', 
'xml_outlinelevel', 'xml_outlinenumber', 'xml_overallocated', 'xml_overtimecost', 
'xml_overtimework', 'xml_percentcomplete', 'xml_percentworkcomplete', 
'xml_physicalpercentcomplete', 'xml_poolresources', 'xml_preleveledfinish', 
'xml_preleveledstart', 'xml_priority', 'xml_projectexternallyedited',
'xml_projects', 'xml_recurring', 'xml_regularwork', 'xml_remainingcost',
'xml_remainingduration', 'xml_remainingovertimecost', 'xml_remainingovertimework', 
'xml_remainingwork', 'xml_removefileproperties', 'xml_resume', 'xml_resumevalid', 
'xml_rollup', 'xml_saveversion', 'xml_schedulefromstart', 'xml_splitsinprogresstasks',
'xml_spreadactualcost', 'xml_spreadpercentcomplete', 'xml_start', 'xml_startvariance',
'xml_stop', 'xml_summary', 'xml_taskupdatesresource', 'xml_totalslack', 'xml_type',
'xml_uid', 'xml_wbs', 'xml_wbsmasks', 'xml_weekstartday', 'xml_work',
'xml_workformat', 'xml_workvariance'];

	FOR i IN 1 .. array_upper(v_fields, 1) LOOP
	    v_field = v_fields[i];
	    select	count(*) into v_count
	    from	information_schema.columns
	    where	table_name = 'im_gantt_projects' and
	    		column_name = v_field;
	    IF v_count = 0 THEN
	    	    RAISE NOTICE 'gantt: field "%" does not exists - creating', v_field;
		    v_cmd := 'alter table im_gantt_projects add column '||v_field||' text';
		    EXECUTE v_cmd;
	    END IF;
	END LOOP;
	return 0;
end;$$ language 'plpgsql';
select inline_0 ();
drop function inline_0 ();


create or replace function inline_0 ()
returns integer as $$
declare
	v_count			integer;
	i			integer;
	v_fields		varchar[];
	v_field			varchar;
	v_cmd			varchar;
begin
	v_fields := array[
'xml_actualcost', 'xml_actualovertimecost', 'xml_actualovertimework',
'xml_actualovertimeworkprotecte', 'xml_actualwork', 
'xml_actualworkprotected', 'xml_acwp', 'xml_availabilityperiods', 
-- 'xml_availablefrom', 'xml_availableto', 'xml_percentworkcomplete', 
-- 'xml_bookingtype', 'xml_creationdate', 'xml_workgroup', 
'xml_calendaruid', 'xml_cost', 'xml_costperuse', 
'xml_costvariance', 'xml_bcwp', 'xml_bcws', 
'xml_cv', 'xml_elements', 
'xml_finish', 'xml_group', 'xml_initials', 'xml_isbudget', 
'xml_iscostresource', 'xml_isenterprise', 'xml_isgeneric', 
'xml_isinactive', 'xml_overtimecost', 'xml_overtimerate', 
'xml_overtimerateformat', 'xml_overtimework', 
'xml_regularwork', 'xml_remainingcost', 
'xml_remainingovertimecost', 'xml_remainingovertimework', 
'xml_remainingwork', 'xml_standardrate', 'xml_standardrateformat', 
'xml_start', 'xml_sv', 'xml_type', 'xml_work', 'xml_workvariance'
];
	FOR i IN 1 .. array_upper(v_fields, 1) LOOP
	    v_field = v_fields[i];
	    select	count(*) into v_count
	    from	information_schema.columns
	    where	table_name = 'im_gantt_persons' and
	    		column_name = v_field;
	    IF v_count = 0 THEN
	    	    RAISE NOTICE 'gantt: field "%" does not exists - creating', v_field;
		    v_cmd := 'alter table im_gantt_persons add column '||v_field||' text';
		    EXECUTE v_cmd;
	    END IF;
	END LOOP;

	return 0;
end;$$ language 'plpgsql';
select inline_0 ();
drop function inline_0 ();





create or replace function inline_0 ()
returns integer as $$
declare
	v_count			integer;
	i			integer;
	v_fields		varchar[];
	v_field			varchar;
	v_cmd			varchar;
begin
	v_fields := array[
'xml_actualcost', 'xml_actualfinish', 'xml_actualovertimecost', 
'xml_actualovertimework', 'xml_actualstart', 'xml_actualwork', 
-- 'xml_actualovertimeworkprotected', 'xml_actualworkprotected', 
-- 'xml_baseline', 
'xml_acwp', 'xml_bcwp', 'xml_bcws', 'xml_bookingtype', 
'xml_confirmed', 'xml_cost', 'xml_costratetable', 'xml_costvariance', 
'xml_creationdate', 'xml_cv', 'xml_delay', 'xml_elements', 
'xml_finish', 'xml_finishvariance', 'xml_fixedmaterial', 
'xml_hasfixedrateunits', 'xml_levelingdelay', 
'xml_levelingdelayformat', 'xml_linkedfields', 'xml_milestone', 
'xml_overallocated', 'xml_overtimecost', 'xml_overtimework', 
'xml_percentworkcomplete', 'xml_regularwork', 'xml_remainingcost', 
'xml_remainingovertimecost', 'xml_remainingovertimework', 
'xml_remainingwork', 'xml_resourceuid', 'xml_responsepending', 
'xml_resume', 'xml_start', 'xml_startvariance', 'xml_stop', 
'xml_taskuid', 'xml_timephaseddata', 'xml_uid', 'xml_units', 
'xml_updateneeded', 'xml_vac', 'xml_work', 'xml_workcontour', 
'xml_workvariance'
];
	FOR i IN 1 .. array_upper(v_fields, 1) LOOP
	    v_field = v_fields[i];
	    select	count(*) into v_count
	    from	information_schema.columns
	    where	table_name = 'im_gantt_assignments' and
	    		column_name = v_field;
	    IF v_count = 0 THEN
	    	    RAISE NOTICE 'gantt: field "%" does not exists - creating', v_field;
		    v_cmd := 'alter table im_gantt_assignments add column '||v_field||' text';
		    EXECUTE v_cmd;
	    END IF;
	END LOOP;
	return 0;
end;$$ language 'plpgsql';
select inline_0 ();
drop function inline_0 ();

