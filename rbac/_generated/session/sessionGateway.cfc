<cfcomponent displayname="sessionGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="rbac.session.sessionGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="id" type="numeric" required="false" />
		<cfargument name="name" type="string" required="false" />
		<cfargument name="created" type="date" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				id,
				name,
				created
			FROM	ac_session
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"id") and len(arguments.id)>
			AND	id = <cfqueryparam value="#arguments.id#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"name") and len(arguments.name)>
			AND	name = <cfqueryparam value="#arguments.name#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"created") and len(arguments.created)>
			AND	created = <cfqueryparam value="#arguments.created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

</cfcomponent>
