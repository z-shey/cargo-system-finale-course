$(document).ready(function () {
    $(".sidebar_menu li").click(function () {
        $(".sidebar_menu li").removeClass("active");
        $(this).addClass("active");
    })
    $(".hamburger").click(function () {
        $(".wrapper").addClass("active");
    })
    $(".bg_shadow,.close").click(function () {
        $(".wrapper").removeClass("active");
    })
})

// 点击菜单项时触发的函数
function changeContent(id) {
    var contents = document.getElementsByClassName('content'); // 获取所有content元素
    for (var i = 0; i < contents.length; i++) {
        contents[i].style.display = 'none'; // 隐藏所有content元素
    }
    var content = document.getElementById(id); // 获取对应ID的content元素
    content.style.display = 'flex'; // 显示当前content元素
}

function searchUser() {
    var searchContent = document.getElementById('searchInput').value;
    var userContainers = document.querySelector('#userManagement').getElementsByClassName('info-container item');
    var noResultsText = document.getElementById('noResults');
    var searchCount = document.getElementById('search_count');

    var foundMatch = false;
    var count = 0;

    for (var i = 0; i < userContainers.length; i++) {
        var currentUserContainer = userContainers[i];
        var userId = currentUserContainer.querySelector('.info-row span').textContent;

        if (searchContent === '' || userId.includes(searchContent)) {
            currentUserContainer.style.display = 'flex';
            foundMatch = true;
            count++;
        } else {
            currentUserContainer.style.display = 'none';
        }
    }

    if (!foundMatch) {
        noResultsText.style.display = 'flex';
    } else {
        noResultsText.style.display = 'none';
        searchCount.textContent = count;
    }
}


function searchCargo() {
    var searchContent = document.getElementById('searchInput').value;
    var userContainers = document.querySelector('#cargoManagement').getElementsByClassName('info-container item');
    var noResultsText = document.getElementById('noResults');
    var searchCount = document.getElementById('search_count');

    var foundMatch = false;
    var count = 0;

    for (var i = 0; i < userContainers.length; i++) {
        var currentUserContainer = userContainers[i];
        var userId = currentUserContainer.querySelector('.info-row span').textContent;

        if (searchContent === '' || userId.includes(searchContent)) {
            currentUserContainer.style.display = 'flex';
            foundMatch = true;
            count++;
        } else {
            currentUserContainer.style.display = 'none';
        }
    }

    if (!foundMatch) {
        noResultsText.style.display = 'flex';
    } else {
        noResultsText.style.display = 'none';
        searchCount.textContent = count;
    }
}