function loadCourses() {
    console.log("hello")
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {

        if (xhttp.readyState == 4 && xhttp.status == 200) {\
            console.log("hello");
            var item = JSON.parse(xhttp.responseText);
            console.log("hello");
            console.log(item);
            //populateCourses(item);
        }

        xhttp.open("GET", "http://localhost:5012/get_all", true);
        xhttp.send();
    }
}

function populateCourses(item) {
    console.log(item);
    for (let i = 1; i <= item.length; i++) {
        itemtoAdd += `<li class="col-md-4">
                                <div class="wm-courses-popular-wrap">
                                    <figure> <a href="#"><img src="extra-images/papular-courses-${i}.jpg" alt=""> <span class="wm-popular-hover"> <small>see course</small> </span> </a>
                                        <figcaption>
                                            <img src="extra-images/papular-courses-thumb-${i}.jpg" alt="">
                                            <h6><a href="#">Shelly T. Forrester</a></h6>
                                        </figcaption>
                                    </figure>
                                    <div class="wm-popular-courses-text">
                                        <h6><a href="#">${item['modules'][i-1]['professor_name']}</a></h6>
                                        </figcaption>
                                    </figure>
                                    <div class="wm-popular-courses-text">
                                        <h6><a href="#">${item['modules'][i-1]['mod_name']}</a></h6>
                                    </div>
                                </div>
                            </li>`;
    }
    console.log(itemToAdd)
    document.getElementsByClassName("courseList").innerHTML = itemtoAdd;

}