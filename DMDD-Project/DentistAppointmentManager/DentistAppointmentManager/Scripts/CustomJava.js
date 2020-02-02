function logout() {
    window.location.href = "/Home/Logout"
}
function loadPatients() {
    var search = document.getElementById('Search');
    window.location.href = "/Appointment/AppointmentSearch?patientSearch=" + search.value;
}
function getSelectedButton() {
    var radios = document.getElementsByName('Patient');

    for (var i = 0, length = radios.length; i < length; i++) {
        if (radios[i].checked) {
            // do whatever you want with the checked radio

            return radios[i].value;
            // only one radio can be logically checked, don't check the rest
            break;
        }
    }
}

function completePatient() {
    var search = getSelectedButton();
    window.location.href = "/Appointment/UpdateAppointment?appID=" + search;
}

function deletePatient() {
    var search = getSelectedButton();
    window.location.href = "/Appointment/deletePatient?patID=" + search;
}