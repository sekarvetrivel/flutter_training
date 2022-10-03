CommonMutations commonMutations = CommonMutations();

class CommonMutations {
  var loginUser = r'''mutation ($data: loginInput) {
  login(loginInput: $data) {
    status_code
    status_message
    result {
      token
      email
      session_id
      account_status
      token_type
      tempOTP
      __typename
    }
    __typename
  }
}
''';
}
