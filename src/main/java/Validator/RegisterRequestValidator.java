package Validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import Command.LEECommand.MemberJoinCommand;

public class RegisterRequestValidator implements Validator {
	private static final String emailRegExp = "^[_A-Za-z0-9-]+(.[_A-Za-z0-9-]+)*@(?:\\w+\\.)+\\w+$";
	private Pattern pattern;

	public RegisterRequestValidator() {
		this.pattern = Pattern.compile(emailRegExp);
	}

	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return MemberJoinCommand.class.isAssignableFrom(clazz);
	}

	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		MemberJoinCommand memberJoinCommand = (MemberJoinCommand) target;
		if (memberJoinCommand.getUserEmail() == null || memberJoinCommand.getUserEmail().trim().isEmpty()) {
			errors.rejectValue("userEmail", "required");
		} else {
			Matcher matcher = pattern.matcher(memberJoinCommand.getUserEmail());
			if (!matcher.matches()) {
				errors.rejectValue("userEmail", "bad");
			}
		}
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userName", "required");
		ValidationUtils.rejectIfEmpty(errors, "pw", "required");
		ValidationUtils.rejectIfEmpty(errors, "pw1", "required");
		ValidationUtils.rejectIfEmpty(errors, "id1", "required");
		ValidationUtils.rejectIfEmpty(errors, "userAddr", "required");
		if (!memberJoinCommand.getPw().isEmpty()) {
			if (!memberJoinCommand.isPwEqualToPw1()) {
				errors.rejectValue("pw1", "nomatch");
			}
		}
	}

}
