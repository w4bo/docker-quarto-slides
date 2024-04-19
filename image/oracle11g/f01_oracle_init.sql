CREATE DIRECTORY ORACLE_DUMP as '/data';

create user foodmart identified by oracle;

grant all privileges to foodmart;

grant read, write on directory oracle_dump to system;
grant read, write on directory oracle_dump to foodmart;