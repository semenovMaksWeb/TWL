-- Таблица роли
CREATE TABLE tech.roles (
    id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
    "name" varchar NOT NULL,
    description text NULL,
    active bool NOT NULL DEFAULT true,
    const_name varchar NOT NULL,
    CONSTRAINT roles_pk PRIMARY KEY (id)
);

CREATE UNIQUE INDEX roles_const_name_unique ON tech."roles" (const_name);

COMMENT ON TABLE tech.roles IS 'Таблица для ролей';

COMMENT ON COLUMN tech.roles.id IS 'Первичный ключ';

COMMENT ON COLUMN tech.roles."name" IS 'Имя роли';

COMMENT ON COLUMN tech.roles.description IS 'Описание роли';

COMMENT ON COLUMN tech.roles.active IS 'Активность роли';

COMMENT ON COLUMN tech.roles.const_name IS 'Констант значения роли';

-- Таблица права
CREATE TABLE tech."right" (
    id int NOT NULL GENERATED ALWAYS AS IDENTITY,
    "name" varchar NULL,
    const_name varchar NULL,
    description varchar NULL,
    active boolean NOT NULL DEFAULT true,
    "date" timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT right_pk PRIMARY KEY (id)
);

CREATE UNIQUE INDEX right_const_name_unique ON tech."right" (const_name);

COMMENT ON TABLE tech."right" IS 'Таблица для прав';

COMMENT ON COLUMN tech."right".id IS 'Первичный ключ';

COMMENT ON COLUMN tech."right"."name" IS 'Имя право';

COMMENT ON COLUMN tech."right".const_name IS 'Констант значения право';

COMMENT ON COLUMN tech."right".description IS 'Описание право';

COMMENT ON COLUMN tech."right".active IS 'Активность право';

COMMENT ON COLUMN tech."right"."date" IS 'Дата создания право';

-- Таблица М/М Роли и права
CREATE TABLE tech.roles_right (
    id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
    id_right int4 NOT NULL,
    id_roles int4 NOT NULL,
    CONSTRAINT right_roles_pk PRIMARY KEY (id),
    CONSTRAINT right_roles_fk_id_right FOREIGN KEY (id_right) REFERENCES tech."right"(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT right_roles_fk_id_roles FOREIGN KEY (id_roles) REFERENCES tech.roles(id) ON DELETE CASCADE ON UPDATE CASCADE
);

COMMENT ON TABLE tech.roles_right IS 'Таблица связь М/М права и роли';

COMMENT ON COLUMN tech.roles_right.id IS 'Первичный ключ';

COMMENT ON COLUMN tech.roles_right.id_right IS 'Внешний ключ право';

COMMENT ON COLUMN tech.roles_right.id_roles IS 'Внешний ключ роли';

-- Таблица М/М Роли и пользователь
CREATE TABLE tech.roles_user (
    id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
    id_user int4 NOT NULL,
    id_roles int4 NOT NULL,
    CONSTRAINT roles_user_pk PRIMARY KEY (id),
    CONSTRAINT roles_user_fk FOREIGN KEY (id_user) REFERENCES tech."user"(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT roles_user_fk_1 FOREIGN KEY (id_roles) REFERENCES tech.roles(id) ON DELETE CASCADE ON UPDATE CASCADE
);

COMMENT ON TABLE tech.roles_user IS 'Таблица связь М/М  роли и пользователи';

COMMENT ON COLUMN tech.roles_user.id IS 'Первичный ключ';

COMMENT ON COLUMN tech.roles_user.id_user IS 'Внешний ключ пользователя';

COMMENT ON COLUMN tech.roles_user.id_roles IS 'Внешний ключ роли';