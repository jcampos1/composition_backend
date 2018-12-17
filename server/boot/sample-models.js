// Copyright IBM Corp. 2015,2016. All Rights Reserved.
// Node module: loopback-example-access-control
// This file is licensed under the Artistic License 2.0.
// License text available at https://opensource.org/licenses/Artistic-2.0

module.exports = function(app) {

  var Population = app.models.population;
  var Continent = app.models.continent;

  /***************** CREACIÓN DE OBJETOS INICIALES *****************/
  function create_objects() {
      Continent.create([
      {
        name: 'America',
        ancestria_snp: 21.9
      },
      {
        name: 'Europa',
        ancestria_snp: 16.9
      },
      {
        name: 'Africa',
        ancestria_snp: 38.7
      },
      {
        name: 'Asia',
        ancestria_snp: 19.8
      },
      {
        name: 'Oceania',
        ancestria_snp: 2.6
      }
    ], function(err, continents) {
      if (err) throw err;

      var POPULATIONS = [{
        "name": "BIAKA ",
        "result_percentage": 0.9
      },
      {
        "name": "MBUTI",
        "result_percentage": 0.87
      },
      {
        "name": "LISONGO",
        "result_percentage": 0.56
      },
      {
        "name": "YRI",
        "result_percentage": 0.43
      },
      {
        "name": "YORUBA",
        "result_percentage": 0.2
      },
      {
        "name": "IBO",
        "result_percentage": 0.43
      },
      {
        "name": "ZARAMO",
        "result_percentage": 0.12
      },
      {
        "name": "HAUSA",
        "result_percentage": 0.45
      },
      {
        "name": "MASAI",
        "result_percentage": 0.87
      },
      {
        "name": "LWK",
        "result_percentage": 1.3
      },
      {
        "name": "CHAGGA",
        "result_percentage": 1.67
      },
      {
        "name": "JUDIOS ROMANOS",
        "result_percentage": 0.9
      },
      {
        "name": "ASHKENASI",
        "result_percentage": 0.3
      },
      {
        "name": "TSI",
        "result_percentage": 0.1
      },
      {
        "name": "IBS",
        "result_percentage": 0.5
      },
      {
        "name": "SARDINIANS",
        "result_percentage": 0.12
      },
      {
        "name": "ADYGEI",
        "result_percentage": 0.35
      },
      {
        "name": "GRIEGOS",
        "result_percentage": 2.56
      },
      {
        "name": "UNGAROS",
        "result_percentage": 0.67
      },
      {
        "name": "CHUVASH",
        "result_percentage": 0.98
      },
      {
        "name": "IRLANDESES",
        "result_percentage": 0.33
      },
      {
        "name": "CEU",
        "result_percentage": 0.22
      },
      {
        "name": "NMAKRANI",
        "result_percentage": 0.11
      },
      {
        "name": "KUWAITI",
        "result_percentage": 0.32
      },
      {
        "name": "KERALA",
        "result_percentage": 0.67
      },
      {
        "name": "THOTI",
        "result_percentage": 0.95
      },
      {
        "name": "KACHARI",
        "result_percentage": 0.34
      },
      {
        "name": "MICRONESIOS",
        "result_percentage": 0.67
      },
      {
        "name": "SAMOANS",
        "result_percentage": 0.23
      },
      {
        "name": "SF CHINISSE",
        "result_percentage": 0.90
      },
      {
        "name": "TW CHINISSE",
        "result_percentage": 0.45
      },
      {
        "name": "PIMA MX",
        "result_percentage": 0.65
      },
      {
        "name": "MAYA",
        "result_percentage": 0.23
      },
      {
        "name": "QUECHUA",
        "result_percentage": 0.1
      }
    ];
      
      // America
      continents[0].populations.create(POPULATIONS.slice(0, 11));
      // Europa
      continents[1].populations.create(POPULATIONS.slice(11, 22));
      // Asia
      continents[3].populations.create(POPULATIONS.slice(22, 27));
      // Oceania
      continents[4].populations.create(POPULATIONS.slice(27, 29));
      // Africa
      continents[2].populations.create(POPULATIONS.slice(29, 34));

      console.log('Poblaciones creadas');
    });
  }

  create_objects(); 
};