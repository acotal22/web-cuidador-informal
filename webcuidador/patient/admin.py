from django.contrib import admin
from .models import Evento,TipoTest, Test, RespuestaNPI, RespuestaZarit, Cuidador

# Register your models here.

class TestAdmin(admin.ModelAdmin):
    list_display = ('cuidador', 'id', 'tipo_test', 'fecha')
    
class ZaritAdmin(admin.ModelAdmin):
    list_display = ('test', 'resultado', 'evaluacion')

class NpiAdmin(admin.ModelAdmin):
    list_display = ('test',)

class EventoAdmin(admin.ModelAdmin):
    list_display = ('id','fecha','user')

#admin.site.register(Paciente)
#admin.site.register(Sintoma)
admin.site.register(Cuidador)
admin.site.register(TipoTest)
admin.site.register(Test, TestAdmin)
admin.site.register(RespuestaNPI, NpiAdmin)
admin.site.register(RespuestaZarit, ZaritAdmin)
admin.site.register(Evento,EventoAdmin)
