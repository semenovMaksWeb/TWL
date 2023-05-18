-- Таблица пользователь
CREATE TABLE tech."user" (
    id int4 NOT NULL GENERATED ALWAYS AS IDENTITY,
    -- первичный ключ
    nik varchar NOT NULL,
    -- уникальное имя пользователя
    email varchar NOT NULL,
    -- почта пользователя
    "password" text NOT NULL,
    -- пароль пользователя
    active bool NOT NULL DEFAULT true,
    -- проверка на возможность работать пользователю
    confirmed bool NOT NULL DEFAULT false,
    -- дата создания пользователя
    CONSTRAINT id_user PRIMARY KEY (id)
);

CREATE UNIQUE INDEX user_nik_unique ON tech."user" USING btree (nik);

CREATE UNIQUE INDEX user_email_unique ON tech."user" (email);

COMMENT ON TABLE tech."user" IS 'Таблица для  пользователей';

COMMENT ON COLUMN tech."user".id IS 'Первичный ключ';

COMMENT ON COLUMN tech."user".nik IS 'Уникальное имя пользователя';

COMMENT ON COLUMN tech."user".email IS 'Почта пользователя';

COMMENT ON COLUMN tech."user"."password" IS 'Пароль пользователя';

COMMENT ON COLUMN tech."user".active IS 'Проверка на возможность работать пользователю';

COMMENT ON COLUMN tech."user".confirmed IS 'Дата создания пользователя';