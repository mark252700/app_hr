import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['notification'];

  connect() {
    this.timeout = setTimeout(() => {
      this.closeNotification();
    }, this.notificationDelayValue);
  }

  disconnect() {
    clearTimeout(this.timeout);
  }

  closeNotification() {
    this.notificationTarget.remove();
  }

  get notificationDelayValue() {
    return parseInt(this.data.get('notification-delay-value')) || 2000;
  }
}
