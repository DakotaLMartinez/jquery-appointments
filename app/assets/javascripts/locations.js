var Location = function(location) {
  this.id = location.id;
  this.nickname = location.nickname;
  this.streetAddress = location.street_address;
  this.city = location.city; 
  this.state = location.state;
  this.zipcode = location.zipcode; 
  this.businessName = location.business_name;
  this.appointments = location.appointments;
  this.clients = location.clients;
};

Location.prototype.showPageLink = function(text) {
  var output = '<a href="/locations/' + this.id + '">';
    output += text;
  output += '</a>';
  return output;
}

Location.prototype.editPageLink = function() {
  var output = '<a class="btn btn-secondary" href="/locations/' + this.id + '/edit">';
    output += "Edit";
  output += '</a>';
  return output;
}

Location.prototype.deleteLink = function() {
  var output = '<a class="btn btn-danger" data-confirm="Are you sure you really want to delete this location?" rel="nofollow" data-method="delete" href="/locations/' + this.id + '">';
    output += "Delete";
  output += '</a>';
  return output;
}

Location.prototype.clientListLink = function() {
  var output = '<a href="/locations/' + this.id + '/client_list">';
    if ( this.clients.length === 1 ) {
      output += "1 client";
    } else {
      output += this.clients.length + ' clients';
    }
  output += '</a>';
  return output;
}

Location.prototype.appointmentsLink = function() {
  var output = '';
  if ( this.appointments.length === 1 ) {
    output += this.showPageLink("1 appointment");
  } else {
    var linkText = this.appointments.length + " appointments";
    output += this.showPageLink(linkText);
  }
  return output;
}

Location.prototype.addAppointmentButton = function() {
  var output = '<a class="btn btn-primary" href="/locations/' + this.id + '/appointments/new">Add Appointment</a>';
  return output;
}

Location.prototype.showBusinessName = function() {
  var output = "";
  if ( this.businessName ) {
    output += '<p>' + this.businessName + '</p>';
  }
  return output;
}

Location.prototype.showStreetAddress = function() {
  var output = "";
  if (this.streetAddress !== "") {
    output += '<p>' + this.streetAddress + '</p>';
  }
  return output;
}

Location.prototype.showCityStateZip = function() {
  var output = "";
  if (this.city && this.state && this.zipcode) {
    output += '<p>' + this.city + ', ' + this.state + ' ' + this.zipcode + '</p>';
  }
  return output;
}

Location.prototype.buildLocationRow = function() {
  var output = '<div class="location row">';
    output += '<div class="col-sm-3">';
      output += '<h4>';
        output += this.showPageLink(this.nickname);
      output += '</h4>';
      output += '<p>';
        output += this.editPageLink();
        output += this.deleteLink();
      output += '</p>';
    output += '</div>';
    output += '<div class="col-sm-3">';
      output += this.showBusinessName();
      output += this.showStreetAddress();
      output += this.showCityStateZip();
    output += '</div>';
    output += '<div class="col-sm-3">';
      output += '<p>' + this.clientListLink() + '</p>';
    output += '</div>';
    output += '<div class="col-sm-3">';
      output += '<p>' + this.appointmentsLink() + '</p>';
      output += '<p>' + this.addAppointmentButton() + '</p>';
    output += '</div>';
  output += '</div>';
  return output;
}


window.getLocations = function (){
  $.get('/locations.json').done(function(data){
    var locations = '';
    $.each(data, function(index, value){
      var location = new Location(data[index]);
      locations += location.buildLocationRow();
    });
    $('.locations').html(locations);
    console.log(locations);
  });
}