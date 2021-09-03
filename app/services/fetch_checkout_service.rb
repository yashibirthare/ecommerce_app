class FetchCheckoutService
	require 'easypost'
	EasyPost.api_key = 'EZTKa2e2c4cb9a784e6c93fb7ea2c0268adfWsbDQtaZS2RgHjDFUooIYg'
	
	attr_accessor :name,:street1,:city,:state,:zip,:country,:phone
	def initialize
	
	end

	def create_address(params)
		to_address = EasyPost::Address.create(:name => params[:name],:street1 => params[:street1],:city => params[:city],:state => params[:state],:zip => params[:zip],:country => params[:country],:phone => params[:phone])	
	end
	def create_parcel
		parcel = EasyPost::Parcel.create(:width => 15.2,:length => 18,:height => 9.5,:weight => 35.1)	
	end

	def create_customs_item
		customs_item = EasyPost::CustomsItem.create(:description => 'EasyPost T-shirts',:quantity => 2,:value => 25.12,:weight => 33,:origin_country => 'in',:hs_tariff_number => 123456)
	end

	def create_customs_info(customs_item)
		customs_info = EasyPost::CustomsInfo.create(:integrated_form_type => 'form_2976',:customs_certify => true,:customs_signer => 'Dr. Pepper',:contents_type => 'gift',:eel_pfc => 'NOEEI 30.37(a)',:non_delivery_option => 'abandon',:restriction_type => 'none',:restriction_comments => '',:customs_items => [customs_item])
	end

	def create_shipment(to_address,parcel,customs_info)
		from_address = EasyPost::Address.create(:company => 'EasyPost',:street1 => '118 2nd Street',:street2 => '4th Floor',:city => 'San Francisco',:state => 'CA',:zip => '94105',:phone => '415-456-7890')
		shipment = EasyPost::Shipment.create(to_address: to_address,from_address: from_address,parcel: parcel,customs_info: customs_info)
	end

end