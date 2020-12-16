deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

BBGW_FLASH = 'Power up the <%= TYPE_NAME %> while holding down the small button near the SD slot.
You need to keep it pressed until the blue LEDs start flashing wildly.'
BBGW_REMOVE_POWER = 'Wait 5 seconds after the blue leds stopped flashing wildly, then remove power from the board. On some boards the leds will shut down completely.'
BBGW_BOARD_POWERON = 'Re-connect power to the board.'

postProvisioningInstructions = [
	BBGW_REMOVE_POWER
	instructions.REMOVE_INSTALL_MEDIA
	BBGW_BOARD_POWERON
]

module.exports =
	version: 1
	slug: 'beaglebone-green-gateway'
	name: 'BeagleBone Green Gateway'
	arch: 'armv7hf'
	state: 'released'
	private: false

	stateInstructions:
		postProvisioning: postProvisioningInstructions

	instructions: [
		instructions.ETCHER_SD
		instructions.EJECT_SD
		instructions.FLASHER_WARNING
		BBGW_FLASH
	].concat(postProvisioningInstructions)

	gettingStartedLink:
		windows: 'https://docs.resin.io/beaglebone/nodejs/getting-started/#adding-your-first-device'
		osx: 'https://docs.resin.io/beaglebone/nodejs/getting-started/#adding-your-first-device'
		linux: 'https://docs.resin.io/beaglebone/nodejs/getting-started/#adding-your-first-device'

	supportsBlink: true

	yocto:
		machine: 'beaglebone-green-gateway'
		image: 'resin-image-flasher'
		fstype: 'resinos-img'
		version: 'yocto-thud'
		deployArtifact: 'resin-image-flasher-beaglebone-green-gateway.resinos-img'
		compressed: true

	options: [ networkOptions.group ]

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
