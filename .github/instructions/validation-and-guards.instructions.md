---
name: validation-and-guards
description: 'Standardized Syrx guard usage and validation rationale.'
applyTo: '**/*.cs'
---
# Validation & Guards

## Pattern
`Throw<TException>(successCondition, message)` where `successCondition == true` means proceed; false throws.

`Require<TException>(successCondition, message)` is also allowed as a semantic alias from `Syrx.Validation.Contract`.

## Repository-Bound Model Rule
- Models crossing repository boundaries (DTO/domain types passed to or returned from repositories) must be immutable.
- Use get-only properties (or equivalent immutable record semantics); no public setters.
- Run all required guard validation at instantiation time (constructor or static factory).
- Use Syrx guard methods from `Syrx.Validation.Contract` (`Throw` or `Require`) for all such validation.

## Null-Forgiving Operator Idiom
After a guard that validates a reference is non-null, use the null-forgiving operator (`!`) when assigning to or passing the validated value. This suppresses the nullable compiler warning without introducing a redundant null-coalescing expression.

```csharp
// ✅ Guard then null-forgive
public OrderService(IOrderRepository orderRepository)
{
    Throw<ArgumentNullException>(orderRepository is not null, nameof(orderRepository));
    _orderRepository = orderRepository!;  // safe: guard already threw if null
}

public async Task<Order> CreateAsync(Order order, CancellationToken cancellationToken = default)
{
    Throw<ArgumentNullException>(order is not null, nameof(order));
    var created = await _orderRepository.CreateAsync(order!, cancellationToken);
    Throw<InvalidOperationException>(created is not null, nameof(created));
    return created!;
}

// ❌ Redundant null-coalescing after guard
_orderRepository = orderRepository ?? throw new ArgumentNullException(nameof(orderRepository));
```

The pattern is: guard asserts the condition holds; `!` expresses to the compiler that you have already verified it.

## Examples
```csharp
Throw<ArgumentNullException>(user != null, nameof(user));
Throw<ArgumentException>(!string.IsNullOrWhiteSpace(email), nameof(email));
```

## Rationale
Fail-fast, centralizes validation semantics, consistent exception taxonomy.

