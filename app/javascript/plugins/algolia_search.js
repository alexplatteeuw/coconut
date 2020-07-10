const search = () => {
  console.log('test');

  const searchClient = algoliasearch(
    'J1OXOAEZEN',
    '137ed19f068ecce19222c603ef7a2cde'
  );

  const autocomplete = instantsearch.connectors.connectAutocomplete(
    ({ indices, refine, widgetParams }, isFirstRendering) => {
      // We get the onSelectChange callback from the widget params
      const { container, onSelectChange } = widgetParams;

      if (isFirstRendering) {
        container.html('<select id="ais-autocomplete"></select>');

        container.find('select').selectize({
          // ...
          onType: refine,
          onChange(value) {
            // We call the provided callback each time a value is selected
            onSelectChange(value);
            refine(value);
          },
        });

        return;
      }

      // ...
    }
  );

  const suggestions = instantsearch({
    indexName: 'demo_ecommerce',
    searchClient,
  });

  suggestions.addWidgets([
    autocomplete({
      container: $('#autocomplete'),
      onSelectChange(value) {
        // Now we can trigger the search on our main instance
        // each time the value inside the dropdown is selected
        search.helper.setQuery(value).search();
      },
    })
  ]);

  const search = instantsearch({
    indexName: 'demo_ecommerce',
    searchClient,
  });

  search.addWidgets([
    instantsearch.widgets.hits({
      container: '#hits',
      templates: {
        item: `
          <div>
            <header class="hit-name">
              {{#helpers.highlight}}{ "attribute": "name" }{{/helpers.highlight}}
            </header>
            <p class="hit-description">
              {{#helpers.highlight}}{ "attribute": "description" }{{/helpers.highlight}}
            </p>
          </div>
        `,
      },
    })
  ]);

  suggestions.start();
  search.start();

}

export { search };
