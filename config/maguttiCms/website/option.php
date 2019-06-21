<?php
return [
    'app' => [
        'name'	   => 'maguttiCms',
		'legal'		=> 'maguttiCms Framework',
        'address'  => '5.3 maguttiCms Street',
        'locality' => 'Bergamo - Italy',
        'lat'      => '45.612310',
        'lng'      => '9.694187',
        'phone'	   => '+39 0363.123456',
        'fax'	   => '+39 035.123456',
        'vat'	   => 'XXXXXXXXX',
        'email'	   => 'info@gfstudio.com',
    ],
    'email' => [
        'default'	   => 'info@gfstudio.com',
        'footer'       => '© Copyright  GFStudio',
    ],
    'news' => [
        'item_home'	  => '3',
    ],
    'images' => [
        'gallery'	  => '1',
        'slider'	  => '2',
        'bottom'	  => '3',
    ],
	// FontAwesome or MaterialIcons
	'icons' => 'fa', 	// 'icons' => 'mi',
	'js_localization' => ['website','message'],
	'ghost_input' => [
		'models' => [
			'CartItem'
		]
	]
];
