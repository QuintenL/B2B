function AjaxError(XMLHttpRequest, textStatus, errorThrown) {
    try {
        // get the .NET Exception from the JSON text
        var err = eval("(" + XMLHttpRequest.responseText + ")");
        // available properties: ExceptionType, Message, and StackTrace
        alert(err.Message + '\n\n_____________________\n\n' + err.StackTrace);
    }
    catch (e) {
        // responseText is most likely not a valid JSON object - that's why eval isn't working
        if (XMLHttpRequest.status == 404) {
            // friendly alert
            alert(XMLHttpRequest.statusText);
        }
        else if (XMLHttpRequest.status == 500) {
            // output the html to the browser - less friendly - but required
            document.clear();
            document.write(XMLHttpRequest.responseText);
        }
        else {
            alert('Unhandled status code ' + XMLHttpRequest.status + ': ' + XMLHttpRequest.statusText + '\n\n_____________________\n\n' + e);
        }
    }
}

function initAjaxSetup() {
    $.ajaxSetup({
        url: "/xmlhttp/",
        global: false,
        type: "POST",
        beforeSend: function (req) { },
        complete: function (req) { },
        error: function () { },
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        cache: false
    });
}

$(document).ready(function () {

    checkCart();

    $(".numeric").keypress(function (event) {
        var controlKeys = [8, 9]; //37, 39, 35, 36
        var isControlKey = controlKeys.join(",").match(new RegExp(event.which));
        if (!event.which || // Control keys in most browsers. e.g. Firefox tab is 0 
                    (48 <= event.which && event.which <= 57) || // Always 1 through 9 
                    isControlKey) { // Opera assigns values for control keys. 
            return;
        } else {
            event.preventDefault();
        }
    });

    $('textarea[maxlength]').keyup(function(){
        var max = parseInt($(this).attr('maxlength'));
        if($(this).val().length > max){
            $(this).val($(this).val().substr(0, $(this).attr('maxlength')));
        }
    })

    $('.brand-filter').live('change', function () {
        showProductList();
    });

    $('.project-filter').on('change', function () {
        SetUniqueRadioButton('rptProject.*projectfilter', this);
        showProductList();
    });

    $('input, textarea').placeholder();

    $("a.fancybox").fancybox({ overlayShow: false });

    $("a.iframe").fancybox({
        'padding': 0,
        'title': '',
        'transitionIn': 'elastic',
        'transitionOut': 'elastic',
        'type': 'iframe',
        'width': 740,
        'height': 530
    });


});

function tryToLogOn() {
    var username = $('#UserName').val();
    var password = $('#Password').val();
    var languageId = $('#LanguageList').val();
    var rememberMe = $('#RememberMe').is(':checked');

    $.ajax({
        url: "/Services/login.asmx/TryLogon",
        data: "{login: '" + username + "', password:'" + password + "', languageId: " + languageId + ", rememberMe: " + rememberMe + "}",
        dataType: "json",
        success: function (result) {
            if (result.d == '') {
                jAlert('Geen artikelen gevonden!', 'Info', null);
            }
            else {
                if (result.d.Failed) {
                    jAlert(result.d.Message, 'Info', null);
                } else {
                    window.location = result.d.Url;
                }
            }
        }
    });

    return false;
}

function logOut() {
    jConfirm(trans[0][1], trans[0][0], function (r) {
        if (r) {
            window.location = '/login.aspx?action=logout';
        }
    });
}

function showInfo(title, message) {

    $.pnotify({
        pnotify_title: title,
        pnotify_text: message,
        pnotify_history: false,
        pnotify_type: "info",
        pnotify_notice_icon: "ui-icon ui-icon-info"
    });
}

function addToCart() {
    // Check if anything is filled in correctly
    var sizeQty = '';
    var sizeQtyMessage = '';
    $(".order-qty").each(function () {
        if ($(this).val() != '' && isNumeric($(this).val())) {
            sizeQty += $(this).data("key") + '|' + $(this).val() + '|' + $(this).data("price") + ',';

            if (sizeQtyMessage != '') {
                sizeQtyMessage += ', ';
            }

            sizeQtyMessage += '<strong>' + $(this).data("name") + '</strong> (x' + $(this).val() + ')';
        }
    });

    if (sizeQty == '') {
        jAlert(trans[3][1], trans[3][0], null);
    }
    else {
        var article = $('#article-title').text();
        var includeLogo = $('#IncludeLogo').is(':checked');

        // ajax call
        $.ajax({
            url: "/Services/order.asmx/AddToBasket",
            data: "{languageId: " + languageId + ", articleId: " + articleId + ", sizeQuantity: '" + sizeQty + "', includeLogo: " + includeLogo + ", projectId: " + $('#ProjectIdValue').val() + "}",
            dataType: "json",
            success: function (result) {
                showInfo(trans[1][0], trans[1][1] + '<br /><br /><span>' + article + '</span><br />' + sizeQtyMessage);
                checkCart();
            }
        });
    }

    return false;
}

function checkCart() {
    if ($("#Cart").length > 0) {
        // check cart value
        $.ajax({
            url: "/Services/order.asmx/GetCartValue",
            data: "{languageId: " + languageId + "}",
            dataType: "json",
            success: function (result) {
                if (result)
                {
                    $("#Cart").html(result.d);
                }
            }
        });
    }
}

function GetCart() {
    // check cart value
    $.ajax({
        url: "/Services/order.asmx/GetCart",
        data: "{languageId: " + languageId + "}",
        dataType: "json",
        success: function (result) {
            if (result) {
                var data = result.d;

                $("#order").empty();

                if (data.length == 0) {
                    $('#message').show();
                    $('#finishcart').hide();
                } else {
                    $('#message').hide();
                    $('#finishcart').show();
                    $('#orderTemplate').tmpl(data).appendTo("#order");
                }
            }
        }
    });
}

function deleteCartLine(articleId) {

    // confirm
    jConfirm(trans[2][1], trans[2][0], function (r) {
        if (r) {
            $.ajax({
                url: "/Services/order.asmx/DeleteCartLine",
                data: "{languageId: " + languageId + ", articleId:" + articleId + "}",
                dataType: "json",
                success: function (result) {
                    if (result) {
                        window.location.reload();
                    }
                }
            });
        }
    });
}

function finishCart() {

    var deliveryTypeId = $('#DeliveryList').val();

    $.blockUI({ message: $('#processingMessage') });

    $.ajax({
        url: "/Services/order.asmx/FinishCart",
        data: "{languageId: " + languageId + ", deliveryTypeId:" + deliveryTypeId + "}",
        dataType: "json",
        success: function (result) {
            if (result) {
                var orderSent = result.d;
                GetCart();
                checkCart();
                
                $.unblockUI();

                if (!orderSent) {
                    jAlert(trans[5][1], trans[5][0], null);
                }else{
                    jAlert(trans[6][1], trans[6][0], null);
                }
            }
        }
    });

    return false;
}

function toggleOrderLines(key, orderId) {
    var rowCount = $('#table-' + key + ' tr').length;
    var isHidden = $('#table-' + key).is(':hidden');

    if (isHidden) {
        if (rowCount == 0) {
            // Get order lines from web service
            $.ajax({
                url: "/Services/order.asmx/GetOrderLines",
                data: "{orderId: " + orderId + "}",
                dataType: "json",
                success: function (result) {
                    if (result.d == '') {
                        jAlert('Something seriously went wrong!', 'Info', null);
                    }
                    else {
                        $('#table-' + key).empty();
                        $('#orderTemplate').tmpl(result.d).appendTo('#table-' + key);
                    }
                }
            });
        }

        // show lines
        $('#table-' + key).show();
        $('#image-' + key).attr('src', '/images/hide.png');
    } else {
        // hide
        $('#table-' + key).hide();
        $('#image-' + key).attr('src', '/images/show.png');
    }
}

function isNumeric(value) {
    var ValidChars = "0123456789";
    var isNumber = true;
    var Char;

    for (i = 0; i < value.length && isNumber == true; i++) {
        Char = value.charAt(i);
        if (ValidChars.indexOf(Char) == -1) {
            isNumber = false;
        }
    }

    return isNumber;
}

function showProducts(pg) {
    productGroupId = pg;
    showProductList();
}

var ticks = 0;
var loading = false;

function showProductList() {

    $('#article-result').empty();

    var now = new Date();
    var currentTicks = now.getTime();
    ticks = currentTicks;

    if ($('.pg').length == 0) {
        return;
    }

    if (productGroupId == 0) {
        productGroupId = $('.pg').first().data("id");
    }

    var productGroup = '';

    $('.pg').removeClass('active');
    $('.pg').each(function () {
        if ($(this).data("id") == productGroupId) {
            $(this).addClass('active');
            productGroup = $(this).children().first().html();
        }
    });

    var selectedBrandList = '';
    $('.brand-filter').each(function () {
        if ($(this).children().is(':checked')) {
            selectedBrandList += $(this).data('id') + ',';
        }
    });

    var selectedProjectList = '';
    $('.project-filter').each(function () {
        if ($(this).children().is(':checked') && $(this).data('id') != '0') {
            selectedProjectList += $(this).data('id') + ',';
        }
    });

    $('#ArticleGroup').html(productGroup);

    // Fetch articles
    $.ajax({
        url: "/Services/article.asmx/GetArticleListIds",
        data: "{languageId: " + languageId + ", productGroupId: " + productGroupId + ", selectedBrandList: '" + selectedBrandList + "', selectedProjectList: '" + selectedProjectList + "'}",
        dataType: "json",
        success: function (result) {
            if (result.d == '') {
                jAlert('Geen producten gevonden!', 'Info', null);
            }
            else {
                if (loading) {
                    setTimeout(function () { startArticleList(0, 8, result.d, currentTicks) }, 500);
                } else {
                    startArticleList(0, 8, result.d, currentTicks);
                }
            }
        }
    });
}

function startArticleList(start, length, fullList, currentTicks) {
    if (loading) {
        setTimeout(function () { startArticleList(start, length, fullList, currentTicks) }, 500);
    } else {
        loading = true;
        $('#article-result').empty();
        showArticleList(start, length, fullList, currentTicks);
    }
}

function showArticleList(start, length, fullList, currentTicks) {

    var last = false;
    var list = fullList;

    // Get list
    if (fullList.length > start + length) {
        list = fullList.slice(start, length + start);
    } else {
        list = fullList.slice(start, fullList.length);
        last = true;
    }

    if (list.length > 0 && currentTicks == ticks) {

        var idList = '';

        for (var i = 0; i < list.length; i++) {
            if (i > 0) {
                idList += ',';
            }

            idList += list[i];
        }

        var selectedBrandList = '';
        $('.brand-filter').each(function () {
            if ($(this).children().is(':checked')) {
                selectedBrandList += $(this).data('id') + ',';
            }
        });

        var selectedProjectList = '';
        $('.project-filter').each(function () {
            if ($(this).children().is(':checked') && $(this).data('id') != '0') {
                selectedProjectList += $(this).data('id') + ',';
            }
        });

        $.ajax({
            url: "/Services/article.asmx/GetArticleListByIdList",
            data: "{languageId: " + languageId + ", idList: '" + idList + "', selectedBrandList: '" + selectedBrandList + "', selectedProjectList: '" + selectedProjectList + "'}",
            dataType: "json",
            success: function (result) {
                if (result.d == '') {
                    jAlert('Geen producten gevonden!', 'Info', null);
                }
                else {

                    if (currentTicks == ticks) {
                        $('#articleListTemplate').tmpl(result.d).appendTo('#article-result');
                        showArticleList(start + length, length, fullList, currentTicks);
                    }
                    else {
                        loading = false;
                    }
                }
            }
        });
    } else {
        loading = false;
    }
}

function LogicalDeleteOrder(title, message, orderId, languageId) {
    jConfirm(message, title, function (r) {
        if (r) {
            window.location = '/orderlist.aspx?l=' + languageId + '&action=delete&id=' + orderId;
        }
    });
}

function showOrder(orderId) {
    $.fancybox({
        'padding': 0,
        'href': '/popup/order.aspx?print=0&l=' + languageId + '&oid=' + orderId,
        'title': '',
        'transitionIn': 'elastic',
        'transitionOut': 'elastic',
        'type': 'iframe',
        'width': 740,
        'height': 530
    });
}

function SetUniqueRadioButton(nameregex, current) {
    $('.project-filter > input').each(function () {
        if ($(this).parent().data('id') != $(current).data('id')) {
            $(this).attr('checked', false);
        }
    });
}