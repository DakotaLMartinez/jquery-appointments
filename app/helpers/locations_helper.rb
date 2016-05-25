module LocationsHelper
  def show_street_address(location)
    if location.street_address && location.street_address != ""
      content_tag(:p, location.street_address)       
    end
  end
  
  def show_business_name(location)
    if location.business_name && location.business_name != ""
      content_tag(:p, location.business_name) 
    end
  end
  
  def city_state_zip(location)
    if location.city && location.state && location.zipcode && location.city != "" && location.state != "" && location.zipcode != ""
      content_tag(:p, "#{location.city}, #{location.state} #{location.zipcode}") 
    end
  end
  
  def show_nickname(location)
    if current_page?(location_path(location))
      location.nickname
    else 
      link_to location.nickname, location_path(location)
    end
  end
  
  def show_address(location)
    render partial: "locations/address", locals: { location: location }
  end
  
  def edit_delete_links(location)
    output = [
      link_to("Edit", edit_location_path(location), class: "btn btn-secondary"),
      link_to("Delete", location, method: :delete, class: "btn btn-danger", data: { confirm: "Are you sure you really want to delete this location" })
    ]
    safe_join(output)
  end
  
  def appointment_count(location)
    link_to pluralize(location.appointment_count, 'appointment'), location_path(location)
  end
  
  def client_count(location)
    link_to pluralize(location.client_count, 'client'), client_list_path(location)
  end
  
  
end
