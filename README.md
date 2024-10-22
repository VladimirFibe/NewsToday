#  News Today

```
    private func setupObservers() {
        store
            .events
            .receive(on: DispatchQueue.main)
            .sink { [weak self] event in
                guard let self else { return }
                switch event {
                case .done(let news):
                    self.news = news
                    self.tableView.reloadData()
                }
            }.store(in: &bag)
    }
```

