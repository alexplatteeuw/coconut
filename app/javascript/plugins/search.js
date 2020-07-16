
  const fetchProjects = (query) => {
    fetch(`/projects?q=${query}`, {
      headers: {
            accept: "application/json"
          }
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data);
        const projectsContainer = document.getElementById('projects-container');
        projectsContainer.innerHTML = data.html;
      });
  };

  const initInstantSearch = () => {
    const searchForm = document.querySelector('.simple_form.search');
    if (searchForm) {
      const searchInput = document.getElementById('search_query');
      document.addEventListener('input', (e) => {
        const queryValue = searchInput.value;
        fetchProjects(queryValue);
      })
    };
  }

export { initInstantSearch };
