package fr.cyu.rt.control.business.event.types;

import fr.cyu.rt.control.api.rest.alert.AlertController;
import fr.cyu.rt.control.business.event.Event;
import fr.cyu.rt.control.business.event.EventType;

import javax.persistence.Entity;
import java.util.Objects;

/**
 * @author Aldric Vitali Silvestre
 */
@Entity
public class AlertDecisionEvent extends Event {

    private boolean isRealAlert = false;

    public AlertDecisionEvent() {
        super(EventType.ALERT_DECISION);
    }

    public AlertDecisionEvent(AlertController.EndAlertRequest request) {
        super(EventType.ALERT_DECISION);
        this.setRealAlert(request.realAlert());
    }

    public boolean isRealAlert() {
        return isRealAlert;
    }

    public void setRealAlert(boolean realAlert) {
        isRealAlert = realAlert;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        if (!super.equals(o)) {
            return false;
        }
        AlertDecisionEvent that = (AlertDecisionEvent) o;
        return isRealAlert == that.isRealAlert;
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), isRealAlert);
    }
}
