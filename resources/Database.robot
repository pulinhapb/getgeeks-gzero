*Settings*
Documentation           Database Helpers

Library     DatabaseLibrary
Library     factories/Users.py

*Keywords*
Connect To Postgres

    Connect To Database     psycopg2
    ...                     wqloxggg
    ...                     wqloxggg
    ...                     Av5VYG9xkAkObreH_en8YV9hfQL1Uykp
    ...                     fanny.db.elephantsql.com
    ...                     5432

Reset Env

    Execute SQL String      DELETE from public.geeks;
    Execute SQL String      DELETE from public.users;

Insert User
    [Arguments]     ${u}

   # ${hashed_pass}     Get Hashed Pass     ${u}[password]

    ${q}    Set Variable    INSERT INTO public.users (name, email, password_hash, is_geek) values ('${u}[name] ${u}[lastname]', '${u}[email]', '${u}[password]', false)

    Execute SQL String      ${q}

Users Seed

    ${user}         Factory User Login
    Insert User     ${user}
