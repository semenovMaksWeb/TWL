-- Таблица токен
CREATE TABLE tech."token" (
    id int NOT NULL GENERATED ALWAYS AS IDENTITY,
    value text NULL,
    "date" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    active boolean NOT NULL DEFAULT true,
    date_end timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP + '1 day',
    id_user int NOT NULL,
    CONSTRAINT token_pk PRIMARY KEY (id),
    CONSTRAINT token_fk FOREIGN KEY (id_user) REFERENCES tech."user"(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE UNIQUE INDEX token_value_unique ON tech."token" (value);

COMMENT ON TABLE tech."token" IS 'Таблица для  токенов пользователей';

COMMENT ON COLUMN tech."token".id IS 'Первичный ключ';

COMMENT ON COLUMN tech."token".value IS 'Значение токена';

COMMENT ON COLUMN tech."token"."date" IS 'Время создание токена';

COMMENT ON COLUMN tech."token".active IS 'Активность токена';

COMMENT ON COLUMN tech."token".date_end IS 'Время жизни токена';

COMMENT ON COLUMN tech."token".id_user IS 'Внешний ключ пользователя';