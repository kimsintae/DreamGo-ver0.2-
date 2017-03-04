    $(document).ready(function () {

        //jquey로 파라미터 값 가져오기
        $.extend({
            getUrlVars: function () {
                var vars = [],
                    hash;
                var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
                for (var i = 0; i < hashes.length; i++) {
                    hash = hashes[i].split('=');
                    vars.push(hash[0]);
                    vars[hash[0]] = hash[1];
                }
                return vars;
            },
            getUrlVar: function (name) {
                return $.getUrlVars()[name];
            }
        }); //extend

        //파라미터 값 뽑기
        var order = $.getUrlVar("order");
        var type = $.getUrlVar("type");

        //페이지 전환되도 선택된 값 유지하기
        $(".typeSelector").val(type);
        $(".orderSelector").val(order);

    })