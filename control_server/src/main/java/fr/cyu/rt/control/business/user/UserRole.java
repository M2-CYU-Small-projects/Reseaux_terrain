package fr.cyu.rt.control.business.user;

/**
 * @author Aldric Vitali Silvestre
 */
public enum UserRole {
    USER("ROLE_USER"),
    ADMIN("ROLE_ADMIN"),
    COM("ROLE_COM"),
    ;

    private String role;

    public String roleName() {
        return role;
    }

    UserRole(String role) {
        this.role = role;
    }
}
