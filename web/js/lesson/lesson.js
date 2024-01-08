const collapsedLessonBtns = document.querySelectorAll(".collapsed");
const collapseLinks = document.querySelectorAll(".collapse .link");

collapsedLessonBtns.forEach(collapsedLessonBtn => {
    collapsedLessonBtn.addEventListener("click", function() {
        const thisCollapsedLesson = this.closest(".accordion-item");
        if(thisCollapsedLesson.classList.contains("accordion-item-active")) {
            thisCollapsedLesson.classList.remove("accordion-item-active");
        }
        else {
            collapsedLessonBtns.forEach(collapsedLessonBtn => {
                collapsedLessonBtn.classList.remove("accordion-item-active");
            })
            thisCollapsedLesson.classList.add("accordion-item-active");
        }
    })
})


collapseLinks.forEach(collapseLink => {
    const href = collapseLink.getAttribute("href");
    console.log(href.substring(17));
    console.log(window.location.search);
    if(href.substring(17) === window.location.search) {
        collapseLink.classList.add("active");
        const thisLessonPart = collapseLink.closest(".accordion-item");
        thisLessonPart.classList.add("accordion-item-active");
    }
})