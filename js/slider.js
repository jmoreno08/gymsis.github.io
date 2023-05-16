(function () {
  const sliders = [...document.querySelectorAll(".seats_body")];
  const buttonNext = document.querySelector("#next");
  const buttonBefore = document.querySelector("#before");
  let value;

  buttonNext.addEventListener("click", () => {
    changePosition(1);
  });
  buttonBefore.addEventListener("click", () => {
    changePosition(-1);
  });

  const changePosition = (add) => {
    const currentSeats = document.querySelector(".seats_body--show")
      .dataset.id;
    console.log(currentSeats);
    value = Number(currentSeats);
    value += add;

    sliders[Number(currentSeats) - 1].classList.remove(
      "seats_body--show"
    );
    if (value === sliders.length + 1 || value === 0) {
      value = value === 0 ? sliders.length : 1;
    }
    sliders[value - 1].classList.add("seats_body--show");
  };
})();
