-- Crear la tabla "Localidad"
CREATE TABLE "Localidad" (
    "ID_Localidad" SERIAL PRIMARY KEY,
    "Nombre" VARCHAR(20),
    "Poblacion" INTEGER
);

-- Crear la tabla "Indicador"
CREATE TABLE "Indicador" (
    "ID_Indicador" SERIAL PRIMARY KEY,
    "Nombre" VARCHAR(20),
    "Descripcion" VARCHAR(100)
);

-- Crear la tabla "Factor_Social"
CREATE TABLE "Factor_Social" (
    "ID_Factor" SERIAL PRIMARY KEY,
    "Nombre" VARCHAR(20),
    "Descripcion" VARCHAR(100)
);

-- Crear la tabla "Adolescente"
CREATE TABLE "Adolescente" (
    "ID_Adolescente" SERIAL PRIMARY KEY,
    "Edad" SMALLINT,
    "Estrato" NUMERIC(1,0),
    "ID_Factor" INTEGER NOT NULL,
    FOREIGN KEY ("ID_Factor") REFERENCES "Factor_Social" ("ID_Factor")
);

-- Crear la tabla "Estructura_Criminal"
CREATE TABLE "Estructura_Criminal" (
    "ID_Estructura" SERIAL PRIMARY KEY,
    "Descripcion" VARCHAR(100)
);

-- Crear la tabla "Victima_Violencia"
CREATE TABLE "Victima_Violencia" (
    "ID_Victima" SERIAL PRIMARY KEY,
    "Tipo_Delito" VARCHAR(30),
    "Descripcion" VARCHAR(100),
    "Genero" CHAR(1),
    "Edad" NUMERIC(1,0)
);

-- Crear la tabla "Delincuente_Juvenil"
CREATE TABLE "Delincuente_Juvenil" (
    "ID_Delincuente" SERIAL PRIMARY KEY,
    "Edad" SMALLINT
);

-- Crear la tabla "Aplicacion_Denuncia"
CREATE TABLE "Aplicacion_Denuncia" (
    "ID_Aplicacion" SERIAL PRIMARY KEY,
    "Descripcion" VARCHAR(100),
    "Entidad_Denunciante" VARCHAR(30)
);

-- Crear la tabla "Adolescente_EstructuraCriminal"
CREATE TABLE "Adolescente_EstructuraCriminal" (
    "ID_Adolescente" INTEGER NOT NULL,
    "ID_Estructura" INTEGER NOT NULL,
    PRIMARY KEY ("ID_Adolescente", "ID_Estructura"),
    FOREIGN KEY ("ID_Adolescente") REFERENCES "Adolescente" ("ID_Adolescente"),
    FOREIGN KEY ("ID_Estructura") REFERENCES "Estructura_Criminal" ("ID_Estructura")
);

-- Crear la tabla "VictimaViolencia_DelincuenteJuvenil"
CREATE TABLE "VictimaViolencia_DelincuenteJuvenil" (
    "ID_Victima" INTEGER NOT NULL,
    "ID_Delincuente" INTEGER NOT NULL,
    PRIMARY KEY ("ID_Victima", "ID_Delincuente"),
    FOREIGN KEY ("ID_Victima") REFERENCES "Victima_Violencia" ("ID_Victima"),
    FOREIGN KEY ("ID_Delincuente") REFERENCES "Delincuente_Juvenil" ("ID_Delincuente")
);

-- Crear la tabla "Barrio"
CREATE TABLE "Barrio" (
    "ID_Barrio" SERIAL PRIMARY KEY,
    "Nombre" VARCHAR(30),
    "ID_Localidad" INTEGER NOT NULL,
    "ZIP_Code" VARCHAR(10),
    "Estrato" INTEGER,
    "ID_Aplicacion" INTEGER NOT NULL,
    FOREIGN KEY ("ID_Localidad") REFERENCES "Localidad" ("ID_Localidad"),
    FOREIGN KEY ("ID_Aplicacion") REFERENCES "Aplicacion_Denuncia" ("ID_Aplicacion")
);

-- Agregar restricciones de clave foránea adicionales a la tabla "Barrio"
ALTER TABLE "Barrio" ADD CONSTRAINT "FK_Barrio_Localidad" FOREIGN KEY ("ID_Localidad") REFERENCES "Localidad" ("ID_Localidad");
ALTER TABLE "Barrio" ADD CONSTRAINT "FK_Barrio_Aplicacion_Denuncia" FOREIGN KEY ("ID_Aplicacion") REFERENCES "Aplicacion_Denuncia" ("ID_Aplicacion");