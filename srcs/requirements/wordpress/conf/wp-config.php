<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv('SQL_DATABASE') );

/** Database username */
define( 'DB_USER', getenv('SQL_USER') );

/** Database password */
define( 'DB_PASSWORD', getenv('SQL_PASSWORD') );

/** Database hostname */
define( 'DB_HOST', getenv('SQL_HOST') );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', getenv('utf8mb4') );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', getenv('') );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'rz]wloOD/|?me1e=45~f<4dhwj;sr@e-cJm-tvm;QV(pR d|*(5rgp6qu8.Z^N=G');
define('SECURE_AUTH_KEY',  '35*#dcXnqS6tQr%Du)Fm*PPa8P6!`/!1k_hH3K]|WST4WZAyN;9JI|^>g7ss|/@(');
define('LOGGED_IN_KEY',    'LqKpjM7A(;T>2WLKH_/x4Y36N3z7gO`z#O|Q ^AXEX k*c)2=*LZ/FnV-&L4HM;k');
define('NONCE_KEY',        ')8SmH~.J/2y%zBQIJB0!P([j,@:4+R%-2m<<|bhMBU-_V?Q6N;Hi(#&$Fje{=C*/');
define('AUTH_SALT',        '<sUbM?MPvX%MxFHl,c]w]Nl95*9gAc4+J]+@/U8C#|i|4U`)Rg2LYp>R^/>8 wl5');
define('SECURE_AUTH_SALT', 'RYd>#+#|P}-H_[pqY`v9[5wO8ixL&k/D1!!gb[#+-G0pr~)[*V-Ry+cx|T!>fP9/');
define('LOGGED_IN_SALT',   '(P27u&!}]kMuC-+b`axBENCJ1:JSPt|)B{C]{x$R+bg+^P(!g/Mu3(S>=hR5sBbA');
define('NONCE_SALT',       'Z(Nm|f`/V_:-z4db63hT@]@SX-d+!/@Mt{+Y695}i8,f*7oPzVst JX|v^Z|F$4(');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
