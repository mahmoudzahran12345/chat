abstract class LoginCubitStates {}

 class LoginInitial extends LoginCubitStates {}

 class ChangePasswordIcon extends LoginCubitStates {}

 class ChangeColorBtnSucsses extends LoginCubitStates {}

 class LoginLoading extends LoginCubitStates {}

 class LoginLoaded extends LoginCubitStates {}

 class LoginError extends LoginCubitStates {
 final String error;
 LoginError({required this.error});
 }


class RegisterLoading extends LoginCubitStates {}

class RegisterLoaded extends LoginCubitStates {}

class RegisterError extends LoginCubitStates {
 final String error;
 RegisterError({required this.error});
}



