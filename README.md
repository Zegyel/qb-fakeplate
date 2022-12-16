# qb-fakeplate
Fake plate Feature for QB-Core Framework :people_holding_hands:

You can make my day happy by giving me some money via:
**[Paypal](https://www.paypal.com/donate/?hosted_button_id=24QLXKUH3M5FQ)**

Added support for setting default number of characters per player per Rockstar license

## Dependencies
- [qb-core](https://github.com/qbcore-framework/qb-core)
- [Ox MySQL](https://github.com/overextended/oxmysql)

## Preview
[Video-Preview](https://www.youtube.com/watch?v=KuE5HlGW5ZU)

## Features
- Install a fake plate on the player's vehicle.
- With the fake plate installed, the police cannot identify the owner of the vehicle.
- The player needs to remove the fake plate from the vehicle before storing in any garage.
- Any player can remove the fake plate from the vehicle, there is a chance that the fake plate will break when removed.
- If you are arrested, the police can also remove the fake plate and fine your vehicle.

## Installation
### Manual
- Download the script and put it in the `[qb]` directory.
- Add the following code to your server.cfg/resouces.cfg
```
ensure qb-fakeplate
```
- Add in [qb]/qb-core/shared/items.lua
```lua
['fakeplate'] 					 = {['name'] = 'fakeplate', 		  	  		['label'] = 'Fake Plate',		 		['weight'] = 250, 		['type'] = 'item', 		['image'] = 'fakeplate.png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'With this fake plate, you won\'t be wanted.'},
```
- Add fakeplate.png image in [qb]/qb-inventory/html/images

**![image](https://user-images.githubusercontent.com/77104201/207998099-b0d7c628-2d8f-4dbb-9cf3-b297e86c88af.png)**

# License

    QBCore Framework
    Copyright (C) 2021 Joshua Eger

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>
