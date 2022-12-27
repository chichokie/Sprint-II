CREATE DATABASE 'pizzeria'

use('pizzeria');db.createCollection('cliente',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "properties": {
    "dirección": {
      "bsonType": "string"
    },
    "nombre": {
      "bsonType": "string"
    },
    "email": {
      "bsonType": "string"
    },
    "registro": {
      "bsonType": "date"
    }
  }
} }});

use('pizzeria');db.createCollection('comanda',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "properties": {
    "precio": {
      "bsonType": "double"
    },
    "hora": {
      "bsonType": "timestamp"
    },
    "email_tienda": {
      "bsonType": "string"
    },
    "cantidad_prod": {
      "bsonType": "int"
    },
    "email_C": {
      "bsonType": "string"
    },
    "reparto": {
      "enum": [
        "SI",
        "NO"
      ]
    }
  }
} }});

use('pizzeria');db.createCollection('comanda_detalle',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "properties": {
    "precio": {
      "bsonType": "double"
    },
    "codigo_prod": {
      "bsonType": "int"
    },
    "hora": {
      "bsonType": "timestamp"
    },
    "codigo_com": {
      "bsonType": "int"
    }
  }
} }});

use('pizzeria');db.createCollection('pizza_cat',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "properties": {
    "descipción": {
      "bsonType": "string"
    },
    "nombre": {
      "bsonType": "string"
    }
  }
} }});

use('pizzeria');db.createCollection('producto',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "properties": {
    "precio": {
      "bsonType": "double"
    },
    "descripción": {
      "bsonType": "string"
    },
    "categoria": {
      "enum": [
        "bebida",
        "hamburguesa",
        "pizza"
      ]
    },
    "imagen": {
      "bsonType": "binData"
    },
    "cat_pizza": {
      "bsonType": "int"
    },
    "nombre": {
      "bsonType": "string"
    }
  }
} }});

use('pizzeria');db.createCollection('tienda',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "required": [
    "email"
  ],
  "properties": {
    "dirección": {
      "bsonType": "string"
    },
    "nombre": {
      "bsonType": "string"
    },
    "email": {
      "bsonType": "string"
    },
    "registro": {
      "bsonType": "date"
    }
  }
} }});

use('pizzeria');db.createCollection('trabajador',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "properties": {
    "puesto": {
      "bsonType": "string"
    },
    "dirección": {
      "bsonType": "string"
    },
    "teléfono": {
      "bsonType": "int"
    },
    "nif": {
      "bsonType": "string"
    },
    "email_tienda": {
      "bsonType": "string"
    },
    "nombre": {
      "bsonType": "string"
    }
  }
} }});
