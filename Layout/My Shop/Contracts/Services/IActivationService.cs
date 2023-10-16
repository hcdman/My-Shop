namespace My_Shop.Contracts.Services;

public interface IActivationService
{
    Task ActivateAsync(object activationArgs);
}
