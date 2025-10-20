
Feature: Pruebas API de Demoblaze (Signup & Login) - Evelyn Balseca

  Background:
    * url 'https://api.demoblaze.com'
    * header Content-Type = 'application/json'

  # Crear un nuevo usuario en signup
  Scenario: Crear nuevo usuario
    * def nuevoUsuario = read('classpath:data/nuevoUsuario.json')
    Given path 'signup'
    And request nuevoUsuario
    When method post
    Then status 200

  # Intentar crear un usuario ya existente
  Scenario: Crear usuario ya existente
    * def usuarioExistente = read('classpath:data/usuarioExistente.json')
    Given path 'signup'
    And request usuarioExistente
    When method post
    Then status 200
    And match response.errorMessage == "This user already exist."

 # Usuario y password correcto en login
  Scenario: Ingresar usuario y password correcto en login
    * def ingresoOk = read('classpath:data/ingresoOK.json')
    Given path 'login'
    And request ingresoOk
    When method post
    Then status 200
    And match response contains 'Auth_token'


 # Usuario y password incorrecto en login
  Scenario: Ingresar usuario y password incorrecto en login
    * def ingresoIncorrecto = read('classpath:data/ingresoIncorrecto.json')
    Given path 'login'
    And request ingresoIncorrecto
    When method post
    Then status 200
    And match response.errorMessage == 'Wrong password.'
    * print 'Respuesta del servicio:', response
