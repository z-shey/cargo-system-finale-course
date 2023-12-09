package entity;

public enum RoleEnum {
    ADMIN(1),
    USER(2),
    GUEST(3);

    private final Integer value;

    RoleEnum(Integer value) {
        this.value = value;
    }

    public Integer getValue() {
        return value;
    }
}

