CREATE DATABASE 'optica'

use('optica');db.createCollection('cliente',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "required": [
    "nombre",
    "email"
  ],
  "properties": {
    "recomendado": {
      "bsonType": "string"
    },
    "direccion": {
      "bsonType": "regex"
    },
    "telefono": {
      "bsonType": "int"
    },
    "nombre": {
      "bsonType": "regex"
    },
    "email": {
      "bsonType": "string"
    },
    "registro": {
      "bsonType": "date"
    }
  }
} }});

use('optica');db.createCollection('gafas',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "required": [
    "codigo",
    "marca"
  ],
  "properties": {
    "marca": {
      "bsonType": "string"
    },
    "email_cliente": {
      "bsonType": "string"
    },
    "codigo": {
      "bsonType": "int"
    },
    "precio": {
      "bsonType": "int"
    },
    "graduacion_D": {
      "bsonType": "int"
    },
    "empleado": {
      "bsonType": "string"
    },
    "graduacion_I": {
      "bsonType": "int"
    },
    "color_vi": {
      "bsonType": "string"
    },
    "tipo_montura": {
      "enum": [
        "flotante",
        "pasta",
        "metalica"
      ]
    },
    "color_vd": {
      "bsonType": "string"
    }
  }
} }});

use('optica');db.createCollection('marca',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "required": [
    "nombre"
  ],
  "properties": {
    "nif": {
      "bsonType": "string"
    },
    "nombre": {
      "bsonType": "string"
    }
  }
} }});

use('optica');db.createCollection('proveedor',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "required": [
    "nif"
  ],
  "properties": {
    "direccion": {
      "bsonType": "regex"
    },
    "nif": {
      "bsonType": "int"
    },
    "telefono": {
      "bsonType": "int"
    },
    "fax": {
      "bsonType": "int"
    },
    "nombre": {
      "bsonType": "string"
    }
  }
} }});
