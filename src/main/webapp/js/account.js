$(function () {

    //Validate Account Form
    $("#saveAccount").click(function (evt) {

        evt.preventDefault();
        $(".error").empty();
        var submitFlag = true;

        if ($("#name").val() === "") {
            $(".error").append("You must fill in your name<br>");
            submitFlag = false;
        }

        if ($("#phone").val() === "") {
            $(".error").append("You must informa your phone number<br>");
            submitFlag = false;
        }

        if ($("#address").val() === "") {
            $(".error").append("You must inform your full address<br>");
            submitFlag = false;
        }

        if (submitFlag)
            this.submit();

    });

    //Validate Credential Form
    $("#saveCredential").click(function (evt) {

        evt.preventDefault();
        $(".errorCredentials").empty();
        var submitFlag = true;

        if ($("#email").val() === "") {
            $(".errorCredentials").append("You must fill in your email<br>");
            submitFlag = false;
        }

        if ($("#psw").val() === "") {
            $(".errorCredentials").append("You must fill in your password<br>");
            submitFlag = false;
        }

        if ($("#psw2").val() === "") {
            $(".errorCredentials").append("You must repeat your password<br>");
            submitFlag = false;
        }

        if ($("#psw2").val() !== $("#psw").val()) {
            $(".errorCredentials").append("Your password must match<br>");
            submitFlag = false;
        }

        if (submitFlag)
            this.submit();

    });

});