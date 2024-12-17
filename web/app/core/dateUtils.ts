import { formatDistanceToNow } from "date-fns";
import { toDate } from "date-fns-tz";

export class DateUtils {
  static formatTimeAgo(dateString: string): string {
    try {
      const units = [
        { label: "year", seconds: 31536000 },
        { label: "month", seconds: 2592000 },
        { label: "week", seconds: 604800 },
        { label: "day", seconds: 86400 },
        { label: "hour", seconds: 3600 },
        { label: "minute", seconds: 60 },
        { label: "second", seconds: 1 },
      ];

      // Helper function to calculate the time difference
      const calculateTimeDifference = (time: number) => {
        for (let { label, seconds } of units) {
          const interval = Math.floor(time / seconds);
          if (interval >= 1) {
            return {
              interval,
              unit: label,
            };
          }
        }
        return {
          interval: 0,
          unit: "second",
        };
      };

      // Parse the date string
      const utcDate = toDate(dateString, { timeZone: "UTC" }); // Handle as UTC
      const currentTime = new Date().getTime();
      const timeDifferenceInSeconds = Math.floor(
        (currentTime - utcDate.getTime()) / 1000
      );

      // Calculate the interval and unit
      const { interval, unit } = calculateTimeDifference(
        timeDifferenceInSeconds
      );

      // Handle singular/plural suffix
      const suffix = interval === 1 ? "" : "s";

      return `${interval} ${unit}${suffix} ago`;
    } catch (error) {
      console.error("Invalid date format:", error);
      return "Invalid date";
    }
  }

  static formatTime(
    dateString: string,
    options: Intl.DateTimeFormatOptions = {
      hour: "2-digit",
      minute: "2-digit",
    }
  ): string {
    try {
      return new Date(dateString).toLocaleTimeString([], options);
    } catch (error) {
      console.error("Invalid date format:", error);
      return "Invalid time";
    }
  }
}
