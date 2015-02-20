$(function() {
    $('#submitSimpleUserForm').click(function (e) {

        var formData = {
            firstName: $('#firstName').val(),
            lastName: $('#lastName').val(),
            email: $('#email').val(),
            login: $('#login').val(),
            password: $('#password').val(),
            personalData: $('#personalData').val()
        }

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "http://localhost:8081/FoodService/resources/user/simple/create/form",
            data: JSON.stringify(formData),
            dataType: "json",
            success: function() {
                alert("SUCCESS")
            },
            error: function () {
                alert("ERROR");
            }
        });
        return false;
    });
});

