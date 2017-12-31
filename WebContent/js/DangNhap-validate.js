$(document).ready(function() {
	$('[data-toggle="popover"]').popover();
		
	$('#submit-btn').click(function(event) {
		usernameInput = $('#username')[0];
		passwordInput = $('#password')[0];
		
		validator.validate(usernameInput, passwordInput);
		
		if(!validator.isValid()) {
			usernameInput.setAttribute('data-content', validator.usernameErr);
			passwordInput.setAttribute('data-content', validator.passwordErr);
			
			$('#username, #password').popover('show');
			
			event.preventDefault();
		}		
	});
	
	$(document).click(function(event) {
		var btn = $('#submit-btn');
		if(!btn.is(event.target)) {
			$('#username, #password').popover('hide');
		}
		
	});	
	
});

var validator = {
		usernameErr: '',
		emailErr: '',
		passwordErr: '',
		confirmPassErr: '',
		validate: function(usernameInput, passwordInput) {
			this.usernameErr = usernameValidate(usernameInput);
			this.passwordErr = passwordValidate(passwordInput);
		},
		isValid: function() {
			return !this.usernameErr && !this.passwordErr;
		}
}

function checkEmpty(input) {
	if(input.value.trim()) {
		return false;
	}
	return true;
}
function usernameValidate(input) {
	if(checkEmpty(input)) {
		return 'Vui long nhap username';
	}
	return '';
}
function passwordValidate(input) {
	if(checkEmpty(input)) {
		return 'Vui long nhap password';
	}
	return '';
}



