
  const fetchProjects = (query) => {
    console.log(query);
    fetch(`/projects?q=${query}`, {
      headers: {
            accept: "application/json"
          }
    })
      .then(response => response.json())
      .then((data) => {
        // data.forEach(car => addCar(car));
        const projectsContainer = document.getElementById('projects-container');
        projectsContainer.innerHTML = data.html;
      });
  };

  const initInstantSearch = () => {
    const searchForm = document.querySelector('.simple_form.search');
    if (searchForm) {
      const searchInput = document.getElementById('search_query');
      document.addEventListener('keyup', (e) => {
        const queryValue = searchInput.value;
        fetchProjects(queryValue);
      })
    };
  }

export { initInstantSearch };
