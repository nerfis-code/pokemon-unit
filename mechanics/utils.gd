class_name Utils

static func rng_by_percet(percet:float) -> bool:
    if percet > randi_range(0,100):
        return true
    return false