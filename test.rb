framework 'CocoaIO.framework'
dict = {}
devices = CocoaIO.sharedInstance.servicesMatching(dict)
usb_devices = devices.select{ |device| device.properties.has_key?("USB Product Name") }
hid_devices = usb_devices.select{ |usb_device| !/(keyboard|trackpad|mouse)/i.match(usb_device.properties["USB Product Name"]).nil? }
if hid_devices.empty?
	puts "No USB keyboard detected"
else
	puts "Some kind of internal keyboard or mouse detected"
end
