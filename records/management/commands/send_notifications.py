# -*- coding: utf-8 -*-
from django.core.management.base import BaseCommand, CommandError
from records.models import Notification
from django.core.mail import send_mail
from django.conf import settings

class Command(BaseCommand):
    help = 'Sends the notifications of the day'

    def handle(self, *args, **options):
        try:
            notifs = Notification.objects.all()
            if notifs:
                coords = set()
                for notif in notifs:
                    coords.add(notif.record.case.coordinator.user.email)

                coords_content = dict.fromkeys(coords, "")

                for notif in notifs:
                    print("LCDTM")
                    notif_content = ("<li style=\"margin-bottom:5px;\">" + str(notif.record.author.get_full_name()) + " ha agregado un registro nuevo para el/la paciente " + str(notif.record.patient.get_full_name()) + " " + "<a href=\"" + "http://" + settings.APP_DNS + "/home/records/patient/"+ str(notif.record.patient.id) + "/record/" + str(notif.record.id) + "/" + "\">" + "(" + (str(notif.record.session_datetime)).strftime('%d/%m/%Y') + ")</a>.</li>")
                    print("LCDTM2")
                    coords_content[notif.record.case.coordinator.user.email] += notif_content

                print("LCDTM3")
                for coord in coords_content:
                    html_message = "<!DOCTYPE HTML><html><body><h3>Estimado/a, le acercamos las últimas novedades de registros vinculadas a sus casos:</h3><ul style=\"padding-left:10px;\">" + coords_content[coord] + u"</ul><p style=\"padding-top:10px\">Atte.<br>El equipo de Fundación Hora Libre</p></body></html>"
                    # send_mail('SUBJECT','CONTENT','from@email.com',['dest1@hotmail.com', 'dest2@hotmail.com'],fail_silently=False)
                    send_mail('Novedades de registros', "",
                              settings.EMAIL_HOST_USER, [coord], fail_silently=False,
                              html_message=html_message)
                notifs.delete()
                print("Notifications sent")
            else:
                print("There are no notifications to send")
        except Exception as e:
            print(e)
