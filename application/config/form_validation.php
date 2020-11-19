<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Validación de datos.
 * Archivo de configuración de reglas de validación de datos.
*/

$config=[
    'inicio_sesion'=>[
        [
            'field'=>'usu_login',
            'label'=>'Nombre de usuario',
            'rules'=>'required|alpha_numeric_spaces|trim',
            'errors'=>[
                'required'=>'Se requiere nombre de usuario'
            ]
        ],
        [
            'field'=>'usu_pass',
            'label'=>'Contraseña',
            'rules'=>'required|alpha_numeric_spaces|trim',
            'errors'=>[
                'required'=>'Se necesita contraseña'
            ]
        ]
    ]
];
$config['error_prefix'] = '';
$config['error_suffix'] = '';