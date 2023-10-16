﻿using System.Collections.ObjectModel;

using CommunityToolkit.Mvvm.ComponentModel;

using My_Shop.Contracts.ViewModels;
using My_Shop.Core.Contracts.Services;
using My_Shop.Core.Models;

namespace My_Shop.ViewModels;

public partial class CategoryViewModel : ObservableRecipient, INavigationAware
{
    private readonly ISampleDataService _sampleDataService;

    public ObservableCollection<SampleOrder> Source { get; } = new ObservableCollection<SampleOrder>();

    public CategoryViewModel(ISampleDataService sampleDataService)
    {
        _sampleDataService = sampleDataService;
    }

    public async void OnNavigatedTo(object parameter)
    {
        Source.Clear();

        // TODO: Replace with real data.
        var data = await _sampleDataService.GetGridDataAsync();

        foreach (var item in data)
        {
            Source.Add(item);
        }
    }

    public void OnNavigatedFrom()
    {
    }
}
